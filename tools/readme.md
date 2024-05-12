# Tools Manual

## Clean Project

You can remove all temporary files using `python3 clean.py`,
the removed files are the hidden from your `.gitignore`. 
So don't hide anything important, or this will be removed.

##  Update Config

You can update your Quartus's configuration file using the `config.toml` file.
To do this, configure your toml file, and then run `python3 update_config.py`.

### Features

* `project.quartus.name` is your project name, this will generate the `.qsf` filename.
* `project.quartus.main_file` is your Top-Level file.
* `project.quartus.quartus_version` is the Quartus' version used for your project.
* `project.quartus.source` is the source of your project.
    * Your modules inside of it will be automatically added if named as `*.v` file.
* If you want to configure your pin-planner, just put them inside the sections 
  `pin_planner.input` or `pin_planner.output`, each variable must get an integer.