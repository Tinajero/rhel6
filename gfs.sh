#!/bin/bash
#
# Codigo que muestra si el servicio GFS esta funcionando

touch	/tmp/Chapter.xml
Chap=/tmp/Chapter.xml 

echo "<?xml version='1.0' encoding='utf-8' ?>" > $Chap
echo '<!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" '>>$Chap
echo '[<!ENTITY % BOOK_ENTITIES SYSTEM "prueba.ent"> %BOOK_ENTITIES;]>' >> $Chap

#Build the chapter id 
echo '<chapter id="chap-prueba-Test_Chapter">' >> $Chap
	echo -e '\t<title>Servicio Cluster</title>' >> $Chap
	echo -e '\t<para>' >> $Chap
	echo -e '\t\tServicios, configuraciones y pruebas de clusters' >> $Chap
	echo -e '\t</para>' >> $Chap
	echo -e '\t<section id="sect-prueba-Test_Chapter-Test_Section_1">' >> $Chap
		echo -e '\t\t<title>Servicio GFS2</title>' >>$Chap	
	
	
		FlagGFSDaemon=$(ps -e | grep -c gfs2) #bandera que se activa si el demonio gfs2 esta activo
		NumMountGFS=$(mount -l -t gfs2 | grep -c gfs2) #Numero de GFS2 montados en el nodo actual
		if [ "$FlagGFSDaemon" -ge "1" -a $NumMountGFS -ge 1 ];
			then 
			Lista=$(mount -l | grep ext4 | awk 'BEGING { } ; {print "\n\t\t\t\t<listitem>\n\t\t\t\t\t<para>Tipo " $5 " del dispositivo " $1"</para>\n\t\t\t\t</listitem>"}') 
			Parrafo="El servicio de GFS2 esta activo y montado en \n\t\t\t<orderedlist>$Lista\n\t\t\t</orderedlist>"
		else
			Parrafo="El servicio de GFS2 no esta activo debido a que no se encontro ningun dispositivo del tipo gfs2 ni el demonio de gfs2"
		fi
		
		echo -e "\t\t<para>">>$Chap
		echo -e "\t\t\t$Parrafo" >>$Chap
		echo -e "\t\t</para>" >>$Chap
		
		
	echo -e '\t</section>' >> $Chap
echo '</chapter>' >> $Chap
		


