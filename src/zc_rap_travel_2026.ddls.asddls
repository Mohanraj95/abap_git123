@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Travel BO object'
@Search.searchable: true
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true

define root view entity ZC_RAP_Travel_2026 as projection on ZI_RAP_Travel_2026 as Travel
{
    key TravelUUID,
    @Search.defaultSearchElement: true    
    TravelID,
       @Consumption.valueHelpDefinition: [ { entity: { name: 'ZCE_RAP_AGENCY_2026', element: 'Agency_Id' } } ]
//       @ObjectModel.text.element: ['AgencyName']
       @Search.defaultSearchElement: true    
    AgencyID,
//    _Agency.Name as AgencyName,
       @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID'} }]
       @ObjectModel.text.element: ['CustomerName']
       @Search.defaultSearchElement: true    
    CustomerID,
      _Customer.LastName as CustomerName, 
    BeginDate,
    EndDate,
     @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
     @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
     @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency'} }]   
    CurrencyCode,
    Description,
    TravelStatus,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _Agency,
    _Booking : redirected to composition child ZC_RAP_Booking_2026,
    _Currency,
    _Customer
}
