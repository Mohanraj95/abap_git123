    @EndUserText.label: 'Travel data'
    @AccessControl.authorizationCheck: #CHECK
    @Search.searchable: true

    @Metadata.allowExtensions: true
define root view entity ZC_RAP_Travel_U_2045
      as projection on ZI_RAP_Travel_U_2045
    {
      //ZI_RAP_TRAVEL_U_####
      key TravelId,
          @Consumption.valueHelpDefinition: [ { entity: { name: 'ZCE_RAP_AGENCY_2026', element: 'Agency_Id' } } ]
          @Search.defaultSearchElement: true
          AgencyId,
          @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Customer', element: 'CustomerID' } } ]
          @Search.defaultSearchElement: true
          CustomerId,
          BeginDate,
          EndDate,
          @Semantics.amount.currencyCode: 'CurrencyCode'
          BookingFee,
          @Semantics.amount.currencyCode: 'CurrencyCode'
          TotalPrice,
          @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Currency', element: 'Currency' } } ]
          CurrencyCode,
          Description,
          Status,
          Createdby,
          Createdat,
          Lastchangedby,
          Lastchangedat,

          /* Associations */
          //ZI_RAP_TRAVEL_U_####
          _Agency,
          _Booking : redirected to composition child ZC_RAP_Booking_U_2045,
          _Currency,
          _Customer
    }
