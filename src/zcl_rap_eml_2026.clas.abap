CLASS zcl_rap_eml_2026 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_eml_2026 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*          READ ENTITIES OF ZI_RAP_Travel_2026
*               ENTITY Travel
*               FROM VALUE #( ( TravelUUID = '1E5984913EACCD471900C0869FF077A6' ) )
*      RESULT DATA(travels).
*
*    out->write( travels ).

              READ ENTITIES OF ZI_RAP_Travel_2026
               ENTITY Travel
               FIELDS ( AgencyID CustomerID  )
               WITH VALUE #( ( TravelUUID = '1E5984913EACCD471900C0869FF077A6' ) )
      RESULT DATA(travels).

*              READ ENTITIES OF ZI_RAP_Travel_2026
*               ENTITY Travel BY \_Booking
*               ALL FIELDS
*               WITH VALUE #( (  ) )
*      RESULT DATA(bookings)
*      FAILED DATA(failed)
*      REPORTED DATA(reported).
     " step 6 - MODIFY Update
*     MODIFY ENTITIES OF ZI_RAP_Travel_2026
*       ENTITY travel
*         DELETE FROM
*            VALUE
*             #( ( TravelUUID  = '1E5984913EACCD471900C0869FF077A6' ) )
*      FAILED DATA(failed)
*      REPORTED DATA(reported).
*
*      " step 6b - Commit Entities
*     COMMIT ENTITIES
*       RESPONSE OF ZI_RAP_Travel_2026
*       FAILED     DATA(failed_commit)
*       REPORTED   DATA(reported_commit).


*     out->write( 'Update done' ).
    out->write( travels ).

  ENDMETHOD.

ENDCLASS.
