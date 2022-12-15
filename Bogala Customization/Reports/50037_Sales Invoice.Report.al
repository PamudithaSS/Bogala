report 50037 "Sales Invoice"
{
    // version ARJUNA-JIT

    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Sales Invoice.rdl';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            CalcFields = Amount;
            DataItemTableView = ORDER(Ascending) WHERE(Status = FILTER(Released));
            RequestFilterFields = "No.";
            column(Name__CompanyInformation; CompanyInformation.Name)
            { }
            column(Address__CompanyInformation; CompanyInformation.Address)
            { }
            column(Address2__CompanyInformation; CompanyInformation."Address 2")
            { }
            column(City__CompanyInformation; CompanyInformation.City)
            { }
            column(County__CompanyInformation; CompanyInformation.County)
            { }
            column(SVATRegis__CompanyInformation; CompanyInformation."SVAT Registration No.")
            { }
            column(PhoneNo__CompanyInformation; CompanyInformation."Phone No.")
            { }
            column(FaxNo__CompanyInformation; CompanyInformation."Fax No.")
            { }
            column(EMail__CompanyInformation; CompanyInformation."E-Mail")
            { }
            column(VATRegis__CompanyInformation; CompanyInformation."VAT Registration No.")
            { }
            column(SWIFTCode__CompanyInformation; CompanyInformation."SWIFT Code")
            { }
            column(BankAccountNo__CompanyInformation; CompanyInformation."Bank Account No.")
            { }
            column(Picture__CompanyInformation; CompanyInformation.Picture)
            { }
            column(Name__Customer; Customer.Name)
            { }
            column(Address__Customer; Customer.Address)
            { }
            column(Address2__Customer; Customer."Address 2")
            { }
            column(County__Customer; Customer.County)
            { }
            column(Customer_City; Customer.City)
            { }
            column(Customer_CountryRegion; CustomerCountryName)
            { }
            column(SVATRegistrationNo__Customer; Customer."SVAT Registration No.")
            { }
            column(Name__BankAccount; BankAccount.Name)
            { }
            column(Address__BankAccount; BankAccount.Address)
            { }
            column(Address2__BankAccount; BankAccount."Address 2")
            { }
            column(City__BankAccount; BankAccount.City)
            { }
            column(BankAccountNo__BankAccount; BankAccount."Bank Account No.")
            { }
            column(OrderDate; "Order Date")
            { }
            column(No; "No.")
            { }
            column(CustomerOrderNumber; "Customer Order Number.")
            { }
            column(CustomerOrderDate; "Customer Order Date")
            { }
            column(SelltoCustomerNo; "Sell-to Customer No.")
            { }
            column(ShippingMarks; "Shipping Marks")
            { }
            column(PaymentTermsCode; "Payment Terms Code")
            { }
            column(Header; InvoiceHeader)
            { }
            column(Hide; Hide)
            { }
            column(Test; Test)
            { }
            column(LKRV; LKRV)
            { }
            column(USDV; USDV)
            { }
            column(Destination; Destination)
            { }
            column(DimensionValueName; Rec349.Name)
            { }
            column(LineComment_; LineComment_)
            { }
            column(CurrencyCode; "Currency Code")
            { }
            column(Vessel; Vessel)
            { }
            column(ShipmentMethodCode; "Shipment Method Code")
            { }
            column(recpaytermdis; recPaymentterm.Description)
            { }
            column(recBankSWIFTCode; recBank."SWIFT Code")
            { }
            column(PackingComm; "Packing Comm.")
            { }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                column(No__SalesLine; "Sales Line"."No.")
                { }
                column(Description__SalesLine; "Sales Line".Description)
                { }
                column(HSCode__SalesLine; "Sales Line"."H.S.Code")
                { }
                column(Quantity__SalesLine; "Sales Line".Quantity)
                { }
                column(UnitofMeasure__SalesLine; "Sales Line"."Unit of Measure")
                { }
                column(NoofPackages__SalesLine; "Sales Line"."No.of Packages")
                { }
                column(UnitPrice__SalesLine; "Sales Line"."Unit Price")
                { }
                column(Amount__SalesLine; "Sales Line".Amount)
                { }
                column(Type__SalesLine; "Sales Line".Type)
                { }
                column(GWeight; GWeight)
                { }
                column(NWeight; NWeight)
                { }
                column(SunTotal; SunTotal)
                { }
                column(ShippingMarksDetails; ShippingMarksDetails)
                { }
                column(freight; freight)
                { }
                column(ExchangeRate; ExchangeRate)
                { }

                trigger OnAfterGetRecord();
                begin
                    GWeight += "Gross Weight";
                    NWeight += "Net Weight";
                    ShippingMarksDetails += "Shipping Marks" + '/';

                    IF Type = Type::Item THEN
                        SunTotal += Amount;

                    if Type = Type::"Charge (Item)" then
                        freight += Amount;
                end;

                trigger OnPreDataItem();
                begin
                    IF InvoiceType = InvoiceType::"Packing List" THEN
                        SETFILTER(Type, 'Item');
                end;
            }

            trigger OnAfterGetRecord();
            begin
                IF Customer.GET("Sell-to Customer No.") THEN;
                //DP-2021-08-06-CAS-05293-G1D0 Start
                Customer.RESET();
                Customer.SETRANGE("No.", "Sell-to Customer No.");
                IF Customer.FINDFIRST THEN BEGIN
                    Country_region.RESET();
                    Country_region.SETRANGE(Code, Customer."Country/Region Code");
                    IF Country_region.FINDFIRST THEN
                        CustomerCountryName := FORMAT(Country_region.Name);
                END;
                //DP-2021-08-06-CAS-05293-G1D0 End

                LKRV := CurrencyExchangeRate.ExchangeAmtFCYToLCY("Order Date", "Currency Code", Amount, "Currency Factor");
                USDV := CurrencyExchangeRate.ExchangeAmtLCYToFCY("Order Date", 'USD', LKRV, CurrencyExchangeRate.ExchangeRate("Order Date", 'USD'));

                IF BankAccount.GET("Bank Code") THEN;

                //
                Rec480.SETRANGE(Rec480."Dimension Set ID", "Dimension Set ID");
                Rec480.SETFILTER(Rec480."Dimension Code", 'SEGMENT');
                IF Rec480.FINDFIRST THEN BEGIN
                    Rec349.SETRANGE(Rec349.Code, Rec480."Dimension Value Code");
                    IF Rec349.FINDFIRST THEN;

                END;
                //

                //
                SlsCmtLine_.RESET;
                SlsCmtLine_.SETFILTER("No.", "No.");
                IF SlsCmtLine_.FINDFIRST THEN
                    REPEAT
                        IF (SlsCmtLine_."Document Line No." > 0) THEN
                            LineComment_ += SlsCmtLine_.Comment;
                    UNTIL SlsCmtLine_.NEXT = 0;

                //==== SW-PaymentTermDiscrption=====
                //recPaymentterm.RESET;
                //recPaymentterm.SETRANGE(recPaymentterm.Code,"Sales Header"."Payment Terms Code");
                //MESSAGE(recPaymentterm.Description);
                IF NOT recPaymentterm.GET("Payment Terms Code") THEN CLEAR(recPaymentterm);
                //

                recBank.RESET;
                recBank.SETRANGE(recBank."No.", "Bank Code");
                recBank.FINDFIRST;
                ExchangeRate := 0;
                if "Currency Code" <> '' then
                    ExchangeRate := 1 / "Currency Factor";
                //IF NOT recBank.GET("Payment Terms Code") THEN CLEAR(recPaymentterm);
            end;

            trigger OnPreDataItem();
            begin
                CLEAR(SunTotal);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(InvoiceType; InvoiceType)
                {
                    Caption = 'Invoice Type';
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS(Picture);
    end;

    trigger OnPreReport();
    begin
        CLEAR(Hide);
        CLEAR(Test);
        CASE InvoiceType OF
            InvoiceType::"Packing List":
                BEGIN
                    InvoiceHeader := 'Packing List';
                    Hide := 2;
                    Test := 1;
                    //CheckWeightPrint:=TRUE;
                    //CheckPackingList:=TRUE;
                END;
            InvoiceType::"Department of Commerce":
                BEGIN
                    InvoiceHeader := 'Invoice';
                    CurrencyCode := 'LKR';
                    Hide := 3;
                    //CheckWeightPrint:=TRUE;
                    //CheckLKR:=TRUE;
                END;
            InvoiceType::"Commercial Invoice":
                BEGIN
                    InvoiceHeader := 'Commercial Invoice';
                    Hide := 1;
                END;
        END;
    end;

    var
        CompanyInformation: Record "Company Information";
        Customer: Record Customer;
        InvoiceHeader: Text[100];
        CheckLKR: Boolean;
        CheckWeightPrint: Boolean;
        CurrencyCode: Code[10];
        CheckPackingList: Boolean;
        CheckCurrUSD: Boolean;
        InvoiceType: Option "Commercial Invoice","Packing List","Department of Commerce";
        Hide: Integer;
        GWeight: Decimal;
        NWeight: Decimal;
        CurrencyExchangeRate: Record "Currency Exchange Rate";
        LKRV: Decimal;
        USDV: Decimal;
        BankAccount: Record "Bank Account";
        Rec480: Record "Dimension Set Entry";
        Rec349: Record "Dimension Value";
        SlsCmtLine_: Record "Sales Comment Line";
        LineComment_: Text;
        SunTotal: Decimal;
        Test: Decimal;
        recPaymentterm: Record "Payment Terms";
        recBank: Record "Bank Account";
        ShippingMarksDetails: Text[1000];
        CustomerCountryName: Text[250];
        Country_region: Record "Country/Region";
        freight: Decimal;
        ExchangeRate: Decimal;
}

