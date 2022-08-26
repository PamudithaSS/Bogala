report 50028 "Proforma InvoiceNew"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Proforma InvoiceNew.rdl';
    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            column(D1_CompanyInfoName; CompanyInfo.Name)
            {
            }
            column(D1_CompanyInfoAddress; CompanyInfo.Address)
            {
            }
            column(D1_CompanyInfoAddress2; CompanyInfo."Address 2")
            {
            }
            column(D1_CompanyInfoCity; CompanyInfo.City)
            {
            }
            column(D1_CountrysName; Countrys.Name)
            {
            }
            column(D1_CompanyInfoPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(D1_CompanyInfoFaxNo; CompanyInfo."Fax No.")
            {
            }
            column(D1_CompanyInfoPicture; CompanyInfo.Picture)
            {
            }
            column(D1_UserSetupEMail; UserSetup."E-Mail")
            {
            }
            column(D1_RVCustomerName; RVCustomer.Name)
            {
            }
            column(D1_RVCustomerAddress; RVCustomer.Address)
            {
            }
            column(D1_RVCustomerAddress2; RVCustomer."Address 2")
            {
            }
            column(D1_CusCityAndPostCode; CusCityAndPostCode)
            {
            }
            column(D1_Country; Country)
            {
            }
            column(D1_RVCustomerPhoneNo; RVCustomer."Phone No.")
            {
            }
            column(D1_No; "No.")
            {
            }
            column(D1_DocumentDate; "Document Date")
            {
            }
            column(D1_PromisedDeliveryDate; "Promised Delivery Date")
            {
            }
            column(D1_CurrencyCode; "Currency Code")
            {
            }
            column(D1_LineComments; "Sales Line"."Packing Comm.")
            {
            }
            column(D1_Destination; Destination)
            {
            }
            column(D1_DeliveryDetails; "Sales Header"."Delivery Details")
            {
            }
            column(D1_BankAccountNo; Bank."Bank Account No.")
            {
            }
            column(D1_BankName; Bank.Name)
            {
            }
            column(D1_BankAddress; Bank.Address)
            {
            }
            column(D1_BankAddress2; Bank."Address 2")
            {
            }
            column(D1_BankCity; Bank.City)
            {
            }
            column(D1_BankCountryName; BankCountry.Name)
            {
            }
            column(D1_BankSWIFTCode; Bank."SWIFT Code")
            {
            }
            column(D1_PaymentTermsDescription; PaymentTerms.Description)
            {
            }
            column(D1_ShipmentMethodCode; MethodCode)
            {
            }
            column(D1_TypeCheck; TypeCheck)
            {
            }
            column(Comment; CommentLine_.Comment)
            {
            }
            column(InvoiceHeader; InvoiceHeader)
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                column(D2_I; "No.")
                {
                }
                column(D2_Descrip; Descrip)
                {
                }
                column(D2_ShippingMarks; "Shipping Marks")
                {
                }
                column(D2_NoofPackages; "No.of Packages")
                {
                }
                column(D2_Quantity; Quantity)
                {
                }
                column(D2_UOM; "Unit of Measure Code")
                {
                }
                column(D2_UnitPrice; "Unit Price")
                {
                }
                column(D2_LineAmount; "Line Amount")
                {
                }
                column(D2_DimensionValueName; DimensionValue.Name)
                {
                }
                column(D2_DVTotal; DVTotal)
                {
                }
                column(D2_TotNbt; TotNbt)
                {
                }
                column(D2_TotSVat; TotSVat)
                {
                }
                column(D2_TotVat; TotVat)
                {
                }
                column(D2_TaxTxt1; TaxTxt[1])
                {
                }

                trigger OnAfterGetRecord();
                begin
                    IF "Tax Liable" THEN
                        SalesTaxCalculate.GetSalesTaxes("Sales Header"."Tax Area Code", "Tax Group Code", "Tax Liable",
                        "Line Amount", Quantity, "Sales Header"."Posting Date",
                        TEMPTaxDetail);
                    IF TEMPTaxDetail.FINDFIRST THEN
                        REPEAT
                            IF COPYSTR(TEMPTaxDetail."Tax Jurisdiction Code", 1, 3) = 'NBT' THEN
                                TotNbt := TEMPTaxDetail."Tax Below Maximum"
                            ELSE
                                IF COPYSTR(TEMPTaxDetail."Tax Jurisdiction Code", 1, 3) = 'VAT' THEN
                                    TotVat := TEMPTaxDetail."Tax Below Maximum"
                                ELSE
                                    IF COPYSTR(TEMPTaxDetail."Tax Jurisdiction Code", 1, 4) = 'SVAT' THEN
                                        TotSVat := TEMPTaxDetail."Tax Below Maximum";
                        UNTIL (TEMPTaxDetail.NEXT = 0);

                    RVItem.RESET;
                    RVItem.SETRANGE("No.", "No.");
                    IF RVItem.FIND('-') THEN;


                    // IF NOT (Type = Type::Item) THEN              //MR
                    //     CurrReport.SHOWOUTPUT := FALSE;

                    DimensionValue.RESET;
                    DimensionValue.SETRANGE(Code, "Shortcut Dimension 1 Code");
                    IF DimensionValue.FIND('-') THEN;


                    IF NOT (TypeCheck AND GSMBInvoiceCheck) THEN
                        DVTotal := DVTotal + "Line Amount";
                    IF (Type = Type::Item) THEN
                        i := i + 1
                    ELSE
                        i := 0;

                    IF (Type = Type::Item) THEN
                        LineComments := LineComments;//+Comments;


                    //Sriyantha 04.23.2014
                    //IF Type = Type::Item THEN
                    Descrip := Description + '  ' + "Description 2" //RVItem.
                    ///ELSE
                    //  Descrip:='';
                    //Sriyantha 04.23.2014

                end;
            }

            trigger OnAfterGetRecord();
            begin
                //PS (+)
                if "Currency Code" = '' then
                    "Currency Code" := 'LKR';
                //PS(-)

                RVCustomer.RESET;
                IF RVCustomer.GET("Sell-to Customer No.") THEN;
                CusCityAndPostCode := RVCustomer.City + '  ' + RVCustomer."Post Code";

                Countrys.RESET;
                Countrys.SETRANGE(Code, RVCustomer."Country/Region Code");
                IF Countrys.FINDFIRST THEN
                    Country := Countrys.Name;


                PaymentTerms.RESET;
                PaymentTerms.SETRANGE(Code, "Payment Terms Code");
                IF PaymentTerms.FIND('-') THEN

                    //==================================
                    Bank.RESET;
                Bank.SETRANGE("No.", "Sales Header"."Bank Code");
                IF Bank.FIND('-') THEN
                    //==================================
                    BankCountry.RESET;
                BankCountry.SETRANGE(Code, Bank."Country/Region Code");
                IF BankCountry.FINDFIRST THEN;

                CommentLine_.RESET;
                CommentLine_.SETFILTER("No.", "No.");
                CommentLine_.SETFILTER(CommentLine_."Document Line No.", '0');
                IF CommentLine_.FINDFIRST THEN;

                IF TypeCheck AND GSMBInvoiceCheck THEN BEGIN
                    DVTotal := GetFOBValue;
                    MethodCode := 'FOB';
                END
                ELSE
                    MethodCode := "Shipment Method Code";
            end;

            trigger OnPreDataItem();
            begin

                Countrys.RESET;
                Countrys.SETRANGE(Code, CompanyInfo."Country/Region Code");
                IF Countrys.FIND('-') THEN;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(TypeCheck; TypeCheck)
                {
                    ApplicationArea = All;
                    Caption = 'Forein';
                }
                field(CustomInvoiceCheck; CustomInvoiceCheck)
                {
                    ApplicationArea = All;
                    Caption = 'Custome Invoice';
                }
                field(GSMBInvoiceCheck; GSMBInvoiceCheck)
                {
                    ApplicationArea = All;
                    Caption = 'GSMB';
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

    trigger OnPreReport();
    begin

        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(Picture);
        UserSetup.RESET;
        UserSetup.SETRANGE("User ID", USERID);
        IF UserSetup.FIND('-') THEN;

        IF (TypeCheck) AND ((CustomInvoiceCheck) OR (GSMBInvoiceCheck)) THEN
            InvoiceHeader := 'Invoice'
        ELSE
            InvoiceHeader := 'Proforma Invoice';
    end;

    var
        CompanyInfo: Record "Company Information";
        RVCustomer: Record Customer;
        DVTotal: Decimal;
        UserSetup: Record "User Setup";
        i: Integer;
        Country: Text[50];
        Countrys: Record "Country/Region";
        DimensionValue: Record "Dimension Value";
        PaymentTerms: Record "Payment Terms";
        Bank: Record "Bank Account";
        LineComments: Text[300];
        RVItem: Record Item;
        BankCountry: Record "Country/Region";
        Descrip: Text[100];
        CusCityAndPostCode: Text[100];
        TaxTxt: array[2] of Code[10];
        TaxPer: array[2] of Decimal;
        TotNbt: Decimal;
        RVTaxDetail: Record "Tax Detail";
        "Nbt%": Decimal;
        "Vat%": Decimal;
        LineNBT: Decimal;
        LineVAT: Decimal;
        LineSVAT: Decimal;
        TotSVat: Decimal;
        TotVat: Decimal;
        TypeCheck: Boolean;
        CommentLine_: Record "Sales Comment Line";
        CustomInvoiceCheck: Boolean;
        InvoiceHeader: Text[100];
        GSMBInvoiceCheck: Boolean;
        MethodCode: Code[10];
        TEMPTaxDetail: Record "Tax Detail" temporary;
        SalesTaxCalculate: Codeunit "Customization Management"; //"Sales Tax Calculate"; ---Ginasena---

    procedure GetFOBValue() val: Decimal;
    var
        SLine: Record "Sales Line";
    begin
        SLine.SETCURRENTKEY("Document Type", "Document No.");
        SLine.SETRANGE("Document Type", "Sales Header"."Document Type");
        SLine.SETRANGE("Document No.", "Sales Header"."No.");
        IF SLine.FINDFIRST THEN BEGIN
            REPEAT
                IF SLine.Type = SLine.Type::"Charge (Item)" THEN
                    val -= SLine."Line Amount"
                ELSE
                    val += SLine."Line Amount";
            UNTIL (SLine.NEXT = 0);
        END;
    end;
}

