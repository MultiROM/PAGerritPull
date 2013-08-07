PA 3.9x Build Instructions
=======================
```
<filler>
```

Modify your `.repo/local_manifest.xml` as follows:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="TheMuppets/proprietary_vendor_samsung" path="vendor/samsung" remote="github" />
  <project name="Ayysir/Glxytools" path="glxytools" remote="github" revision="master" />
</manifest>
```

```
repo sync
vendor/cm/get-prebuilts
```

Build
=====

```
. build/envsetup.sh
breakfast pa_(d2tmo)-userdebug   # only if building for d2tmo
chmod +x /glxytools/cm-10.2-d2x.sh
./glxytools/cm-10.2-d2x.sh   # apply our patches (done on topic branch 'auto')
mka bacon
```
