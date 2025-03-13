@EndUserText.label: 'RAP Agency ce'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_CE_RAP_AGENCY_2026'
define custom entity ZCE_RAP_AGENCY_2026

{
  key Agency_Id:abap.numc( 6 );
        Name:abap.numc( 31 );

        Street:abap.numc( 30 );

        Postal_code:abap.numc( 10 );

        City:abap.numc( 25 );

        Country:abap.numc( 3 );

        phone_number:abap.numc( 30 );
        
        web_address:abap.numc( 255 );
  
}
