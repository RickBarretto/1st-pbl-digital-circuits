from pathlib import Path

# from https://github.com/uiri/toml
import toml # pip install toml


def _global_assing(name: str, content: str):
    return f'set_global_assignment -name {name} "{content}"'

def format_family(name: str):
    return _global_assing("FAMILY", name)

def format_device(model: str):
    return _global_assing("DEVICE", model)

def format_main(file: str):
    return _global_assing("TOP_LEVEL_ENTITY", file)

def format_file(file: str):
    return _global_assing("VERILOG_FILE", file)

def format_performance():
    return "\n".join([
        _global_assing("SMART_RECOMPILE", "ON"),
        _global_assing("NUM_PARALLEL_PROCESSORS", "ALL"),
        _global_assing("FLOW_ENABLE_IO_ASSIGNMENT_ANALYSIS", "ON")
    ])

def format_pin(variable: str, code: int):
    return f"set_location_assignment PIN_{code} -to {variable}"


with open("config.toml", encoding="utf-8") as config_file:
    config = toml.load(config_file)
    
    quartus = config["project"]["quartus"]
    project = quartus["name"]
    device = config["device"]

    source = Path(quartus["source"])
    output = Path(f"{project}.qsf")
    
    redirect = [
        "# Compiling Configuration",
        format_main(quartus["main_file"]),
        "",
        "# Device Configuration",
        format_family(device["family"]),
        format_device(device["model"]),
        "",
        "# Performance Configuration",
        format_performance()
    ]

    redirect.append("")
    redirect.append("# Modules Including")

    redirect += [format_file(str(file).replace("\\", "/")) for file in source.glob("**/*.v")]

    redirect.append("")
    redirect.append("# Input Setting")

    redirect += [format_pin(variable, pin) for variable, pin in 
        config["pin_planner"]["input"].items()
    ]

    redirect.append("")
    redirect.append("# Output Setting")

    redirect += [format_pin(variable, pin) for variable, pin in 
        config["pin_planner"]["output"].items()
    ]

    with open(output, "+w") as out_file:
        out_file.writelines(map(lambda x: x + "\n", redirect))


