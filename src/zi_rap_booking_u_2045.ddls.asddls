@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking base BO'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_RAP_booking_U_2045 as select from /dmo/booking
association to parent ZI_RAP_Travel_U_2045 as _Travel on $projection.TravelId = _Travel.TravelId
association[0..1] to /dmo/customer as _Customer on $projection.CustomerId = _Customer.customer_id
association[0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
   association [1..1] to /DMO/I_Carrier            as _Carrier    on  $projection.CarrierId    = _Carrier.AirlineID
   association [1..1] to /DMO/I_Connection         as _Connection on  $projection.CarrierId    = _Connection.AirlineID
                                                                  and $projection.ConnectionId = _Connection.ConnectionID
   association [1..1] to /DMO/I_Flight             as _Flight     on  $projection.CarrierId    = _Flight.AirlineID
                                                                  and $projection.ConnectionId = _Flight.ConnectionID
                                                                  and $projection.FlightDate   = _Flight.FlightDate
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    _Travel,
    _Customer,
    _Currency,
    _Carrier,
    _Flight,
    _Connection
}
