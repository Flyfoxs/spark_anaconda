## 0 Summary

目前能找到的Spark集群, 如果是想使用Python来开发Spark. 

在Repo中, 通过删除一些冲突的包,补充一些依赖包,成功安装融合了Anaconda3



## 1 Usage 

### 1.1 开启Spark集群

```shell
./bin/main.sh
```



###  1.2 验证: Pandas DF to Spark DF

```shell
docker exec -it -e PYSPARK_PYTHON=python3 spark-master  /spark/bin/pyspark 
```



```python
#准备Pandas Dataframe
import pandas as pd
csv_url = 'https://raw.githubusercontent.com/cs109/2014_data/master/countries.csv'
pandas_df = pd.read_csv(csv_url)
df.head()

#转换为Spark Dataframe
spark_df = spark.createDataFrame(pandas_df)
spark_df.schema
```





## 2 修改办法

### 2.1 原始[Spark集群](https://github.com/big-data-europe/docker-spark/blob/2.4.5-hadoop2.7/base/Dockerfile)的问题

* Python环境不太完整, 比如缺少pandas之类的包
* 无法直接安装Anaconda, 缺少glibc

* 直接安装pandas, 各种依赖包



### 2.2 解决办法

* 删除python3, 否则会与 Anaconda 的 Python冲突

* 删除libc6-compat, 否则与glibc冲突, 无法安装Anaconda

* 安装Anaconda3

  



The solution is inspire by [this repo](https://github.com/big-data-europe/docker-spark/blob/2.4.5-hadoop2.7/base/Dockerfile)

