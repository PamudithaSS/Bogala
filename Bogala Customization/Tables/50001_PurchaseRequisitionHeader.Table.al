table 50001 "Purchase Requisition Header"
{
    DataCaptionFields = "Document No.", "Document Date";
    //LookupPageID = 50003;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Editable = false;
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = 'PR,Fixed Asset,SR';
            OptionMembers = PR,"Fixed Asset",SR;
        }
        field(3; "Document Date"; Date)
        { }
        field(4; Name; Code[50])
        { }
        field(9; "Forecasted Week of Use"; Code[10])
        { }
        field(14; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(15; "Purchase Order No."; Code[20])
        {
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Order));
        }
        field(16; Status; Option)
        {
            Editable = true;
            OptionMembers = Open,Released,Rejected,"Sent for Approval","First Level Approval","Second Level Approval";
        }
        field(17; "PR Type"; Option)
        {
            OptionCaption = ' ,Admin,Maintenance,Consumption ,Consignment';
            OptionMembers = " ",Admin,Maintenance,"Consumption ",Consignment;
        }
        field(18; "Item Category"; Code[10])
        {
            TableRelation = "Item Category".Code;
        }
        field(19; Criticality; Option)
        {
            OptionMembers = " ",Urgent,"Normal ";
        }
        field(20; Description; Text[50])
        { }
        field(21; "Product Group"; Code[10])
        {
            TableRelation = if ("Item Category" = filter(<> '')) "BGL Product Group".Code where("Item Category Code" = field("Item Category"))
            else
            "BGL Product Group".Code;
        }
        field(24; "Asset Location"; Code[10])
        {
            TableRelation = "FA Location";
        }
        field(25; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = CONST(1));
        }
        field(26; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = CONST(2));
        }
        field(29; Amount; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Purchase Requistion Lines"."Item Value" where("Document No." = field("Document No.")));
        }
        field(30; "Asset Category"; Code[10])
        { }
        field(31; "FA Class Code"; Code[10])
        {
            TableRelation = "FA Class".Code;
        }
        field(32; "FA SubClass Code"; Code[10])
        {
            TableRelation = "FA Subclass".Code;
        }
        field(40; "G/L Account No."; Code[20])
        { }
        field(42; "Reason Code"; Code[10])
        {
            TableRelation = "Reason Code";
        }
        field(47; "Items Required Date"; Date)
        { }
        field(50; "Requisition Flag"; Boolean)
        { }
        field(55; "Currency Code"; Code[20])
        {
            TableRelation = Currency.Code;
        }
        field(56; "Location Code"; Code[20])
        {
            TableRelation = Location;
        }
        field(1001; "Prepared By"; Text[30])
        { }
        field(1002; "Prepared On"; Date)
        { }
        field(2003; "PO. Created"; Boolean)
        { }
        field(50001; "Consignment Invoice No."; Text[30])
        { }
        field(50002; "Reference Order"; Text[30])
        { }
        field(50003; "Reference PN No."; Text[30])
        { }
        field(50004; Department; Code[20])
        {
            TableRelation = Location;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.")
        { }
    }

    fieldgroups
    { }

    trigger OnDelete();
    var
        PurchReqLines: Record "Purchase Requistion Lines";
    begin
        TestField(Status, Status::Open);
        PurchReqLines.RESET;
        PurchReqLines.SetRange("Document Type", "Document Type");
        PurchReqLines.SetRange("Document No.", "Document No.");
        IF PurchReqLines.FindSet() then
            PurchReqLines.DeleteAll();
    end;

    trigger OnInsert();
    var
        PurchSetup: Record "Purchases & Payables Setup";
        GLSetup: Record "General Ledger Setup";
    begin

        if ("Document No." = '') then begin
            if "Document Type" = "Document Type"::PR then begin
                PurchSetup.GET;
                PurchSetup.TestField("Purchase Requistion Nos.");
                NoSeriesMgt.InitSeries(PurchSetup."Purchase Requistion Nos.", xRec."No. Series", "Document Date", "Document No.", "No. Series");
            end;
            GLSetup.GET;
            GLSetup.TestField("FA Capex Nos.");
            GLSetup.TestField(GLSetup."Service Request Nos.");

            if "Document Type" = "Document Type"::"Fixed Asset" then
                NoSeriesMgt.InitSeries(GLSetup."FA Capex Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");

            if "Document Type" = "Document Type"::SR then
                NoSeriesMgt.InitSeries(GLSetup."Service Request Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        "Prepared By" := USERID;
        "Prepared On" := TODAY;
    end;

    trigger OnModify();
    begin
        TestField(Status, Status::Open);
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;

    procedure AssistEdit(OldPurchReqHead: Record "Purchase Requisition Header"): Boolean;
    var
        PurchSetup: Record "Purchases & Payables Setup";
        GLSetup: Record "General Ledger Setup";
        cduNoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "Document Type" = "Document Type"::PR then begin
            PurchSetup.GET;
            if cduNoSeriesMgt.SelectSeries(PurchSetup."Purchase Requistion Nos.", OldPurchReqHead."No. Series", "No. Series") then begin
                PurchSetup.GET;
                cduNoSeriesMgt.SetSeries("Document No.");
                exit(true);
            end;
        end;

        GLSetup.GET;
        if "Document Type" = "Document Type"::"Fixed Asset" then begin
            if cduNoSeriesMgt.SelectSeries(GLSetup."FA Capex Nos.", OldPurchReqHead."No. Series", "No. Series") then begin
                cduNoSeriesMgt.SetSeries("Document No.");
                exit(true);
            end;
        end;

        if "Document Type" = "Document Type"::SR then begin
            if cduNoSeriesMgt.SelectSeries(GLSetup."Service Request Nos.", OldPurchReqHead."No. Series", "No. Series") then begin
                cduNoSeriesMgt.SetSeries("Document No.");
                exit(true);
            end;
        end;
    end;

    procedure BudgetValue(var dateBudgetDate: Date): Date;
    var
        dateBudgetStartDate: Date;
    begin
        dateBudgetStartDate := DMY2Date(1, DATE2DMY(dateBudgetDate, 2), DATE2DMY(dateBudgetDate, 3));
        exit(dateBudgetStartDate);
    end;
}

