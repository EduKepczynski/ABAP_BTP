CLASS zcl_display_cds_flight DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: lv_aa(2) TYPE c VALUE 'AA'.

* Interface utilizada para exibir dados no Console.
* Não é possível executar o método CL_DEMO_OUTPUT=>DISPLAY nesse servidor.
* Por isso usei o método out->write.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

**********************************************************************

CLASS zcl_display_cds_flight IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT *
    FROM zekf_cds_flight( carrid = @lv_aa ) "Parâmetro utilizado no CDS
    INTO TABLE @DATA(it_flight).

    out->write( EXPORTING data = it_flight ).

  ENDMETHOD.

ENDCLASS.
