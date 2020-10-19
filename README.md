# How to use

## pull
```
$ docker pull kleinmask/jupyter-lab
```

## run
```
$ docker run -d --rm -p ${YOUR_USE_PORT}:8888 -v ${YOUR_USE_DIR_PATH}:/work kleinmask/jupyter-lab
```
### example values
|  key  |  value  |
| ---- | ---- |
|  YOUR_USE_PORT  |  8888  |
|  YOUR_USE_DIR_PATH  |  /User/hoge/python_dev  |

