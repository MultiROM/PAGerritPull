PA 3.9x Build Instructions
=======================
```
<filler>
```

Modify your `.repo/local_manifest.xml` as follows:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="Ayysir/PAGerritPull" path="pagerrit" remote="github" revision="jb43" />
</manifest>
```

Build
=====

```
1) chmod +x /pagerrit/jb43.sh
2) ./pagerrit/jb43.sh  # apply our patches (done on topic branch 'auto')
# if your brave enough, include this line in the rom-build.sh otherwise don't try it
```
