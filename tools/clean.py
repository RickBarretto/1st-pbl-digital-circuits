from pathlib import Path

project = "irrigation-system"
git_ignore = Path(".gitignore").read_text()
source = Path("./")

directories: list[Path] = []

print(f"Cleaning {project}'s at root...")

for pattern in git_ignore.splitlines():
    for file in source.glob(pattern):
        if file.is_file():
            print(file)
            file.unlink()
        elif file.is_dir():
            directories.append(file)

for directory in directories:
    print(directory)
    directory.rmdir()
