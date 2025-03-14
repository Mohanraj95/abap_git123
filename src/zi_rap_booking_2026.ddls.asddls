@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Booking CDS base model'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_RAP_Booking_2026 as select from zrap_abook_2026 as Booking

   association to parent ZI_RAP_Travel_2026  as _Travel     on  $projection.TravelUuid = _Travel.TravelUUID
   association [1..1] to /DMO/I_Customer           as _Customer   on  $projection.CustomerId   = _Customer.CustomerID
   association [1..1] to /DMO/I_Carrier            as _Carrier    on  $projection.CarrierId    = _Carrier.AirlineID
   association [1..1] to /DMO/I_Connection         as _Connection on  $projection.CarrierId    = _Connection.AirlineID
                                                                  and $projection.ConnectionId = _Connection.ConnectionID
   association [1..1] to /DMO/I_Flight             as _Flight     on  $projection.CarrierId    = _Flight.AirlineID
                                                                  and $projection.ConnectionId = _Flight.ConnectionID
                                                                  and $projection.FlightDate   = _Flight.FlightDate
   association [0..1] to I_Currency                as _Currency   on $projection.CurrencyCode    = _Currency.Currency  
{
    key booking_uuid as BookingUuid,
    travel_uuid as TravelUuid,
    booking_id as BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    created_by as CreatedBy,
    last_changed_by as LastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
       /* associations */
       _Travel,
       _Customer,
       _Carrier,
       _Connection,
       _Flight,
       _Currency
}
