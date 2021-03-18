create database jxgl on(
name=jxal_data,
filename='‪D:\jxgl.mdf',
size=5MB,maxsize=200MB,
filegrowth=5%
)
log on(
name=jxgl_log,
filename='‪D:\jxgl.ldf',
size=5MB,maxsize=200MB,
filegrowth=2MB)
