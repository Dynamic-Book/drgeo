Instructions to install [Dr. Geo](https://www.gnu.org/s/dr-geo/) with
Cuis-Smalltalk rolling release.

# Set-up
Set up your development environment:
```bash
mkdir Cuis
```

## Cuis-Smalltalk code & VM
Fetch and install Cuis-Smalltalk image, VM and needed additional packages
```bash
cd Cuis
git clone --depth 1 https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev
git clone --depth 1 https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-UI
git clone --depth 1 https://github.com/Cuis-Smalltalk/Erudite
git clone --depth 1 https://github.com/Cuis-Smalltalk/Numerics
git clone --depth 1 https://github.com/Cuis-Smalltalk/Parsers
git clone --depth 1 https://github.com/Cuis-Smalltalk/SVG
```

## Dr. Geo code

Fetch the Dr. Geo repository, with source and script

```bash
cd Cuis/Cuis-Smalltalk-Dev
git clone --depth 1 https://github.com/hilaire/drgeo
```

## Dr. Geo IDE

Run the Dr. Geo IDE script. It installs DrGeo code and related
packages into its development environment.

```bash
cd Cuis/Cuis-Smalltalk-Dev
./drgeo/startIDE.sh
```

A new image **drgeoIDE.image** is built and started.

In the image execute:

```smalltalk
DrGeoSystem beDevelopment
```

To start Dr. Geo execute:

```smalltalk
DrGeo new
```

Have an interesting exploration!
