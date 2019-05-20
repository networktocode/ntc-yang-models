ntc-system
##########



Types
=====
snmp-version
------------

SNMP version


**type**: ``enumeration``


* ``1``: SNMP version 1


* ``2c``: SNMP version 2c


* ``3``: SNMP version 3

Data nodes
==========
/system
-------
**nodetype**: ``container``


-----

/system/config
--------------
**nodetype**: ``container``


-----

/system/config/snmp
-------------------
**nodetype**: ``container``


-----

/system/config/snmp/communities
-------------------------------
**nodetype**: ``list``


-----

/system/config/snmp/communities/name
------------------------------------
**nodetype**: ``leaf`` (list key)

**Type**: ``string``



-----

/system/config/snmp/communities/version
---------------------------------------
**nodetype**: ``leaf``

**Type**: ``snmp-version``



-----

/system/config/snmp/communities/access-list
-------------------------------------------
**nodetype**: ``container``


-----

/system/config/snmp/communities/access-list/ipv4
------------------------------------------------
**nodetype**: ``leaf``

**Type**: ``string``



-----

/system/config/snmp/communities/access-list/ipv6
------------------------------------------------
**nodetype**: ``leaf``

**Type**: ``string``



-----

/system/config/snmp/name
------------------------
**nodetype**: ``leaf``

**Type**: ``string``



-----

/system/config/snmp/description
-------------------------------
**nodetype**: ``leaf``

**Type**: ``string``



-----

/system/config/snmp/contact
---------------------------
**nodetype**: ``leaf``

**Type**: ``string``



-----

/system/config/snmp/location
----------------------------
**nodetype**: ``leaf``

**Type**: ``string``



-----

/system/state
-------------
**nodetype**: ``container``


-----

/system/state/snmp
------------------
**nodetype**: ``container``


-----

/system/state/snmp/communities
------------------------------
**nodetype**: ``list``


-----

/system/state/snmp/communities/name
-----------------------------------
**nodetype**: ``leaf`` (list key)

**Type**: ``string``



-----

/system/state/snmp/communities/version
--------------------------------------
**nodetype**: ``leaf``

**Type**: ``snmp-version``



-----

/system/state/snmp/communities/access-list
------------------------------------------
**nodetype**: ``container``


-----

/system/state/snmp/communities/access-list/ipv4
-----------------------------------------------
**nodetype**: ``leaf``

**Type**: ``string``



-----

/system/state/snmp/communities/access-list/ipv6
-----------------------------------------------
**nodetype**: ``leaf``

**Type**: ``string``



-----

/system/state/snmp/name
-----------------------
**nodetype**: ``leaf``

**Type**: ``string``



-----

/system/state/snmp/description
------------------------------
**nodetype**: ``leaf``

**Type**: ``string``



-----

/system/state/snmp/contact
--------------------------
**nodetype**: ``leaf``

**Type**: ``string``



-----

/system/state/snmp/location
---------------------------
**nodetype**: ``leaf``

**Type**: ``string``



-----



