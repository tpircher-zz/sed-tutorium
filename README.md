Eine kleine Einführung in sed
=============================

A small introduction in sed (in German language).

This document is released under the
[http://creativecommons.org/licenses/by-sa/3.0/](Creative Commons
Attribution-Share Alike 3.0 Unported License).


Neue Versionen
==============

Die jeweils neueste Version der Einführung in sed kann auf
[http://www.tty1.net/sed-tutorium_de.html](http://www.tty1.net/sed-tutorium_de.html)
eingesehen werden.

Der Docbook Quellcode ist auf
[http://github.com/tpircher/sed-tutorium](http://github.com/tpircher/sed-tutorium)
gehostet.


Generierung der HTML-Dateien
============================

Es muessen in den Dateien
- parameters-chunked-html.xsl
- parameters-html.xsl
die Pfade zu den Docbook Stylesheets angegeben werden.
z.B.: <xsl:import href="/usr/share/sgml/docbook/stylesheet/xsl/nwalsh/xhtml/docbook.xsl"/>

Anschliessend ein 'make all' eingegeben und die HTML Dateien wedem im Verzeichnis 'out'
generiert.


Feedback
========

Bitte gern und zwar an <tehpeh@gmx.net>.
