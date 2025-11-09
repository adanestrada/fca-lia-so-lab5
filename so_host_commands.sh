
#1. Pull the Spark Docker Image: First, obtain the official Apache Spark Docker image.
docker pull apache/spark:latest

#2. Example commando to Start the Spark Master:
#Run a Docker container for the Spark master. Expose the necessary ports for the Spark UI (8080) and the master's communication port (7077).
docker run -d -p 8080:8080 -p 7077:7077 --name spark-master apache/spark:latest /opt/spark/bin/spark-class org.apache.spark.deploy.master.Master
#Confirm the Spark UI is running as expected: http://localhost:8080/
#Extract the IP of the  Spark Master from Spark UI 
# In my case at spark://172.17.0.2:7077 URL: spark://172.17.0.2:7077 (En caso de que tu master IP cambie actualizar en los comandos subsecuentes)

#3. Example command to Start a Spark Worker and add it to the cluster
#Run a Docker container for a Spark worker, linking it to the master. Replace spark-master with the actual name or IP of your Spark master container if it's different.
docker run -d --name spark-worker-1 --link spark-master:spark-master apache/spark:latest /opt/spark/bin/spark-class org.apache.spark.deploy.worker.Worker spark://spark-master:7077 --cores 1 --memory 4g
docker run -d --name spark-worker-2 --link spark-master:spark-master apache/spark:latest /opt/spark/bin/spark-class org.apache.spark.deploy.worker.Worker spark://spark-master:7077 --cores 2 --memory 2g

#4. Example command to submit a Spark Application (Pi Montecarlo using 10 partitions):
docker exec spark-master /opt/spark/bin/spark-submit --class org.apache.spark.examples.SparkPi --master spark://172.17.0.2:7077 /opt/spark/examples/jars/spark-examples_2.13-4.0.1.jar 10000

#Example command to stop and delete container.
### Force stop and remove the Container: docker rm -f <container_name>


# Después de probar los comandos de ejemplo previos. Eliminar contenedores worker. (Solo dejar contenedor del nodo Master) Para los siguientes Ejericios
docker rm -f spark-worker-1
docker rm -f spark-worker-2


#########################################################
######### Ejercicio 1
# - Crear un cluster de Spark con un nodo y dos cores con 3 gb de RAM
# - Correr el ejemplo de Cálculo de Pi usando: 3000 4000 y 5000 particiones
#
# Nota, se debe modificar el comando de la creación del worker 
#(Ejecutar este comando una sola vez)


# Se debe modificar el comando de ejecución de una aplicación de Spark en tres ocasiones.
# Crear su pdf de entrega de evidencias con la captura de la pantalla de la Spark UI después de haber ejecutado 3 veces la aplicación de Pi
# Crear una tabla con los resultados de Pi, error y tiempo de ejecución del cluster por cada ejecución (3)
# Después de finalizar el Ejercicio 1 y obntener su evidencia, eliminar los contenedores de los nodos worker. (Solo dejar contenedor del nodo Master) Para Ejericio 2
#########################################################


#########################################################
######### Ejercicio 2

# - Crear un cluster de Spark con dos nodos; con 1 core y 2 gb de RAM cada uno.
# - Correr el ejemplo de Cálculo de Pi usando: 3000 4000 y 5000 particiones
#
# Nota, se debe modificar el comando de la creación del worker (Ejecutar este comando una sola vez)
# Se debe modificar el comando de ejecución de una aplicación de Spark en tres ocasiones.
# Crear su pdf de entrega de evidencias con la captura de la pantalla de la Spark UI después de haber ejecutado 3 veces la aplicación de Pi
# Crear una tabla con los resultados de Pi, error y tiempo de ejecución del cluster por cada ejecución (3)

#########################################################


#########################################################
######### Ejercicio 3

# - Crear un cluster de Spark con cuatro nodos; con 1 core y 1 gb de RAM cada uno.
# - Correr el ejemplo de Cálculo de Pi usando: 3000 4000 y 5000  particiones
#
# Nota, se debe modificar el comando de la creación del worker (Ejecutar este comando una sola vez)
# Se debe modificar el comando de ejecución de una aplicación de Spark en tres ocasiones.
# Crear su pdf de entrega de evidencias con la captura de la pantalla de la Spark UI después de haber ejecutado 3 veces la aplicación de Pi
# Crear una tabla con los resultados de Pi, error y tiempo de ejecución del cluster por cada ejecución (3)

#########################################################
