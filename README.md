Instructions to install Dr. Geo in a Cuis-Smalltalk developer environment.

# 1. Set up your Cuis-Smalltalk dev environment

mkdir Cuis
cd Cuis
# Install Cuis image and packages
```bash
git clone --depth 1 https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev.git
git clone --depth 1 https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-UI.git
git clone --depth 1 https://github.com/Cuis-Smalltalk/Erudite.git
git clone --depth 1 https://github.com/Cuis-Smalltalk/Numerics.git

cd Cuis-Smalltalk-Dev
./clonePackageRepos.sh
./pullAllRepos.sh
```

# 2. Install Virtual Machine

```bash
wget -O cogspur.tgz https://github.com/OpenSmalltalk/opensmalltalk-vm/releases/latest/download/squeak.cog.spur_linux64x64.tar.gz
tar -zxvf cogspur.tgz
mv ./sqcogspur64linuxht ./cogspur
```

# 3. Fetch the Dr. Geo repository, with source and script

```bash
cd Cuis/Cuis-Smalltalk-Dev
git clone --depth 1 https://github.com/hilaire/drgeo.git
```

# 4. Start the Dr. Geo IDE

```bash
./drgeo/startIDE.sh
```

A new image drgeoIDE.image is built. In the image execute:

```smalltalk
DrGeoSystem beDevelopment
```

then execute:

```smalltalk
DrGeo new
```

to start Dr. Geo

Have an interesting exploration!
