from pathlib import Path

project = "irrigation-system"
git_ignore = Path(".gitignore").read_text().splitlines()
source = Path("./")

print(f"Cleaning {project}'s at root...")

def unlink(path: Path):
    if path.is_dir():
        for child in path.iterdir():
            unlink(child)
        print(f"Directory removed: {path}\n")
        path.rmdir()
    elif path.is_file():
        print(f"File removed: {path}")
        path.unlink()

for pattern in git_ignore:
    for path in source.glob(pattern):
        unlink(path)