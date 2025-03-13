@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Base BO object'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_RAP_Travel_U_2045 as select from /dmo/travel
composition[0..*] of zi_rap_booking_u_2045 as _Booking
association[0..1] to /dmo/agency as _Agency on $projection.AgencyId = _Agency.agency_id 
association[0..1] to /dmo/customer as _Customer on $projection.CustomerId = _Customer.customer_id
association[0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
{
    key travel_id as TravelId,
    agency_id as AgencyId,
    customer_id as CustomerId, 
    begin_date as BeginDate,
    end_date as EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'    
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    status as Status,
    createdby as Createdby,
    createdat as Createdat,
    lastchangedby as Lastchangedby,
    lastchangedat as Lastchangedat,
    _Booking,
    _Agency,
    _Customer,
    _Currency
}
