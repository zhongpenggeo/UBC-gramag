这个库是我在学习UBC-GIF的重磁三维反演时候的一些笔记和代码  
mark
#### Introduction
整个GravForMedeling3D文件夹是从github clone过来的，不知道为什么无法显示原作者信息。  
clone地址：https://github.com/GeoGoku/GravForModeling3D  

#### 主要目的
建立反演数据的格式化--为了便于paraview成图。  

#### 修改及增加
1. 增加density\_add\_coordinate.m函数，用来给密度模型增加空间网格信息，注意由于密度是建立在一个cell里面的，所以空间的坐标取的是cell中点的坐标。这个m文件与GravForMedeling3D文件夹里面的Mesh3D.m功能一样，但是适应性更强，适应v5.1的mesh格式。
2. translate目录下面是几个sh脚本，
  - cpgra.sh是用来把inv目录下反演最后一次迭代得到的密度和预测文件copy到output，并分别命名为gravity\_density.txt和gravity\_prediction.txt  
  - format\_density.m调用了density\_add\_coordinate.m函数，并且不启动matlab界面直接执行m文件，这个功能放在cpgra.sh中（即最后一行）  
  - tovtk.sh是调用xyz2vtk程序（由于该程序源代码不公开，我可能会上传编译好的exe文件）吧格式化之后的密度转为paraview可用的vtk文件。

后期可能会把translate里面的脚本合为一个Makefile，如果Windows下可以支持Makefile的话。
