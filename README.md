Eine kleine Einführung in sed
=============================

A small introduction in sed (in German language).

This document is released under the
[Creative Commons Attribution-Share Alike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/).


Neue Versionen
--------------

Die jeweils neueste Version der Einführung in sed kann auf
[http://www.tty1.net/sed-tutorium_de.html](http://www.tty1.net/sed-tutorium_de.html)
eingesehen werden.

Der Docbook Quellcode ist auf
[https://github.com/tpircher/sed-tutorium](https://github.com/tpircher/sed-tutorium)
gehostet.


Generierung der HTML-Dateien
----------------------------

Folgende Dateien beinhalten hart-kodierte Pfade zu den DocBook Stylesheets:
- parameters-chunked-html.xsl
- parameters-html.xsl
- parameters-epub.xsl
- parameters-fo.xsl
z.B.: <xsl:import href="file:///usr/share/sgml/docbook/stylesheet/xsl/nwalsh/xhtml/docbook.xsl"/>

Anschliessend ein 'make all' eingegeben und die HTML Dateien wedem im Verzeichnis 'out' generiert.


Feedback
--------

Bitte gern und zwar an <tehpeh@gmx.net>.
