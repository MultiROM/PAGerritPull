PA 3.9x Build Instructions
=======================
```
    repopick.py is a utility to simplify the process of cherry picking
    patches from Paranoid Android's Gerrit.

    Given a list of change numbers, repopick will cd into the project path
    and cherry pick the latest patch available.

    With the --start-branch argument, the user can specify that a branch
    should be created before cherry picking. This is useful for
    cherry-picking many patches into a common branch which can be easily
    abandoned later (good for testing other's changes.)

    The --abandon-first argument, when used in conjuction with the
    --start-branch option, will cause repopick to abandon the specified
    branch in all repos first before performing any cherry picks.
    
    Credit for tool: CyanogenMod 
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
