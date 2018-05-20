# ag-ops

Set of ebuilds for SysAdmins or DevOps for use on Gentoo.
An attempt is made to keep updated versions of some useful tools.

## Usage

Please see the [Gentoo Wiki](https://wiki.gentoo.org/wiki/Ebuild_repository) for an expanded overview 
of ebuilds and unofficial repositories for Gentoo.

You can enable this overlay by simply executing the following:

```
eselect repository enable ag-ops
```

This assumes that you have installed the `app-eselect/eselect-repository` package.



#### Packages

| Count | Category/Name       | Description                    |
|-------|------------|--------------------------------|
| 1     | `sys-process/netatop`   | Optional kernel module for `atop` to gather statistics about TCP/UDP packets transmitted/received per process and per thread  |

