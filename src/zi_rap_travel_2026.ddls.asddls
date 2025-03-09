@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Travel CDS view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_RAP_Travel_2026 as select from zrap_atrav_2026 as Travel
   composition [0..*] of ZI_RAP_Booking_2026 as _Booking
   association [0..1] to ZCE_RAP_AGENCY_2026  as _Agency   on $projection.AgencyID = _Agency.Agency_Id
   association [0..1] to /DMO/I_Customer     as _Customer on $projection.CustomerID = _Customer.CustomerID
   association [0..1] to I_Currency          as _Currency on $projection.CurrencyCode = _Currency.Currency  
{
    key travel_uuid as TravelUUID,
    travel_id as TravelID,
    agency_id as AgencyID,
    customer_id as CustomerID,
    begin_date as BeginDate,
    end_date as EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'    
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    overall_status as TravelStatus,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    local_last_changed_at as LocalLastChangedAt,
       /* associations */
       _Booking,
       _Agency,
       _Customer,
       _Currency       
}
