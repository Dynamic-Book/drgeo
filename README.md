Instructions to install Dr. Geo in a Cuis-Smalltalk developer environment.

# Set-up
Set up your Cuis-Smalltalk dev environment:
```bash
mkdir Cuis
cd Cuis
```

## Cuis-Smalltalk code
Fetch and install Cuis-Smalltalk images and packages
```bash
git clone --depth 1 https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev.git
git clone --depth 1 https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-UI.git
git clone --depth 1 https://github.com/Cuis-Smalltalk/Erudite.git
git clone --depth 1 https://github.com/Cuis-Smalltalk/Numerics.git

cd Cuis-Smalltalk-Dev
./clonePackageRepos.sh
./pullAllRepos.sh
```

## VM
Install virtual machine

```bash
wget -O cogspur.tgz https://github.com/OpenSmalltalk/opensmalltalk-vm/releases/latest/download/squeak.cog.spur_linux64x64.tar.gz
tar -zxvf cogspur.tgz
mv ./sqcogspur64linuxht ./cogspur
```

## Dr. Geo code

Fetch the Dr. Geo repository, with source and script

```bash
cd Cuis/Cuis-Smalltalk-Dev
git clone --depth 1 https://github.com/hilaire/drgeo.git
```

## Dr. Geo IDE

Run the Dr. Geo IDE script. It installs DrGeo code and realted
packages into its development environment.

```bash
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
