Os dejo el informe que hay que hacer del Proyecto Final de Carrera tres meses antes de defensarlo. Mi proyecto está relacionado con la [computación distribuida y los Grid](http://en.wikipedia.org/wiki/Grid_computing) De forma muy simple, mi proyecto estudiará como se puede crear un mercado o supermercardo donde puedes alquilar ordenadores a distancia para que trabajen para ti durante un tiempo. Creo que lo he resumido muy a la ligera, pero me parece sencillo de entender…:)

Bueno, me queda unos 400 metros duros de verdad durante estos tres meses para presentar el proyecto, porque además nuevos proyectos pueden aparecer… Os contaré en tal caso.

Mi informe:  

  
Objetivos

-   Realizar un estudio de diferentes modelos económicos aplicados a sistemas distribuidos
-   Crear un modelo en un entorno real

Trabajo realizado

Estudio de modelos económicos

La gran mayoría de los trabajos estudiados se basan en sistemas de subastas en donde los recursos a subastar son en su mayoría la CPU, más concretamente el tiempo de proceso de una máquina. Los estudios son amplios pero el enfoque es limitado y no se considera el mercado como un conjunto de recursos de diferentes usuarios distribuidos en una red heterogénea.

Este hecho ha llevado que tan sólo que se haya realizado modelos económicos muy acotados y específicos y todos ellos enfocados en la negociación de los recursos, pero no en el estudio de la usabilidad y servicios que debe contemplar un mercado computacional.

Escenario

El escenario del proyecto es una red de computadores distribuidos entre diferentes organizaciones y empresas que forman parte de un parque tecnológico. El mercado debe tener las siguientes características:

-   Un modelo de mercado que beneficia al mismo Grid: premia a aquellos que introducen recursos más potentes y con mejor rendimiento
-   Los partipantes están todos debidamente autenticados y pueden realizar transacciones económicas seguras

Definición del modelo de mercado

El mercado a implementar está basado en el paradigma de consumidor y productor. Hay usuarios que proporcionan recursos computacionales y otros que en su necesidad los adquiere durante un tiempo.

El mercado debe beneficiar la competencia así como premiar aquellos productores de recursos que ofrecen recursos de mayores prestaciones y con mejor rendimiento. Para ello, los precios se basarán en dos conceptos: la demanda y las prestaciones de los recursos.

La demanda, cuanto más usuarios adquieran un recurso, más valor adquirirá.

Las prestaciones, se basarán en estáticas o aquellas prestaciones teóricas del recurso y dinámicas o aquellas prestaciones reales que logra el recurso en su funcionamiento. Para las prestaciones, se tienen en cuenta los siguientes componentes de los recursos:

-   net\_in: capacidad máxima de entrada de red
-   net\_out: capacidad máxima de salida de red
-   machine\_type: arquitectura del recurso
-   cpu\_speed: frecuencia de reloj máxima
-   cpu\_int: número de procesadores
-   mem\_total: memoria máxima de intercambio temporal
-   disk\_total: memoria máxima de almacenamiento

Diseño

El mercado se ha decidido que sea centralizado en contra de una arquitectura descentralizada como es el P2P. El motivo principal de usar un sistema centralizado es que este mercado necesita de una seguridad y confianza elevada para llevar a cabo su actividad. Los sistemas centralizados son muy efectivos a la hora de proporcionar seguridad porque puede existir un actor de confianza entre los usuarios que gestione más efeicientemente la seguridad.

Partiendo que el mercado se implementa en un escenario bien definido que es el de una red de ordenadores de un parque tecnológico, el comportamiento de los usuarios no aporta problemas de escabilidad del sistema. En cualquier caso, si los usuarios aumentan considerablmente, este escenario permite redimensionar con tiempo los servicios centrales.

El diseño se basará en un servidor centralizado multi-cliente donde se conectarán n usuarios con un cliente gráfico para realizar todas las gestiones del mercado. El servidor consultará un servicio de información de recursos distribuido para calcular los precios.

  
Implementación servidor

-   Implementado en JAVA
-   Servidor multi-cliente
-   Dos puertos de escucha con el cliente, uno no seguro y un segundo seguro usando autenticación por certificados, encriptación mediante RSA y autorización
-   Comunicación mediante mensajes XML con el cliente
-   Rutina independiente y automática que accede al servidor de información de recursos del Grid, procesa la información de los recursos, calcula el precio de cada recurso en función de las fórmulas propuestas y guarda la información en forma de histórico en la Base de Datos
-   Base de Datos mysql con tabla de históricos del rendimiento de recursos y tabla de autorización clientes

Implementación cliente

-   Implementado en JAVA con interficie gráfica SWING
-   Gestión básica del certificado personal para concexión con el mercado
-   Comunicación con el mercado mediante canales no seguro y seguro ssl y mensajes XML
-   Formulario funcional de consulta básica de recursos disponibles a partir de parámetros del usuario. Presentación del resultado del servidor en tabla
-   Servidor de información
-   Estudio, instalación, configuración y desplegamiento del servicio de información de clustering Ganglia (gmon) sobre un Grid de 20 computadoras
-   Estudio, instalación, configuración del índice de información de los recursos Ganglia (gmetad)

CA

-   Se ha creado una pequeña Autoridad Certificadora para la creación de certificados del servidor y del cliente

Memoria

-   Introducción, motivación y estado del arte

Trabajo a realizar

Servidor

-   En la base de datos tablas de cartera y registro de operaciones de los usuarios así como de triggers para gestionar operaciones de mantenimiento automáticos
-   Activación/Desactivación de los recursos de un compra por un cliente para que pueda ejecuatar trabajos mediante el middleware Globus.

Cliente

-   Formulario de compra de recursos
-   Formulario de visualización de la cartera
-   Activar/desactivar un recurso de su propiedad en el Grid

Pruebas

-   Analizar el comportamiento de diferentes parámetros en la generación de los precios
-   Probar diferentes escenarios de recursos

Memoria

-   Diseño, tecnología, anexo