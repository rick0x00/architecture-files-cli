# architecture files cli

Create architecture files and directories for my projects

```shell
tree
```
output
```
📂 .
├── 📂 DOCUMENTS
├── 📂 HARDWARE
│  ├── 📂 CAD
│  │  └── 📂 FreeCAD
│  ├── 📂 DOCUMENTS
│  ├── 📂 EDA
│  │  └── 📂 KiCad
│  └── 📃 README.md
├── 📂 SOFTWARE
│  ├── 📂 DOCUMENTS
│  └── 📃 README.md
├── 📃 LICENSE
└── 📃 README.md
```
command execution

via curl
```shell
bash -c "$(curl -fsSL https://raw.githubusercontent.com/silvajhb/architecture-files-cli/master/mkarchdir.sh)"
```

via wget
```shell
bash -c "$(wget https://raw.githubusercontent.com/silvajhb/architecture-files-cli/master/mkarchdir.sh -O -)"
```
