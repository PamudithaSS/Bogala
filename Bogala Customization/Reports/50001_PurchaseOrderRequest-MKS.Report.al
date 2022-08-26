report 50001 "Purchase Order Request - MKS"
{
    //DefaultLayout = RDLC;
    RDLCLayout = './Reports/Purchase Order Request - MKS.rdl';

    dataset
    {
        dataitem("Purchase Requisition Header"; "Purchase Requisition Header")
        {
            DataItemTableView = WHERE("Document Type" = FILTER(PR));
            RequestFilterFields = "Document No.";
            column(Name_CompanyInfo; CompanyInfo.Name)
            { }
            column(Picture_CompanyInfo; CompanyInfo.Picture)
            { }
            column(DocumentNo_PurchaseRequisitionHeader; "Purchase Requisition Header"."Document No.")
            { }
            column(DocumentType_PurchaseRequisitionHeader; "Purchase Requisition Header"."Document Type")
            { }
            column(DocumentDate_PurchaseRequisitionHeader; "Purchase Requisition Header"."Document Date")
            { }
            column(Name_PurchaseRequisitionHeader; "Purchase Requisition Header".Name)
            { }
            column(PurchaseOrderNo_PurchaseRequisitionHeader; "Purchase Requisition Header"."Purchase Order No.")
            { }
            column(Status_PurchaseRequisitionHeader; "Purchase Requisition Header".Status)
            { }
            column(PRType_PurchaseRequisitionHeader; "Purchase Requisition Header"."PR Type")
            { }
            column(Description_PurchaseRequisitionHeader; "Purchase Requisition Header".Description)
            { }
            column(ShortcutDimension2Code_PurchaseRequisitionHeader; "Purchase Requisition Header"."Shortcut Dimension 2 Code")
            { }
            column(ItemsRequiredDate_PurchaseRequisitionHeader; "Purchase Requisition Header"."Items Required Date")
            { }
            column(LocationCode_PurchaseRequisitionHeader; "Purchase Requisition Header"."Location Code")
            { }
            column(PreparedBy_PurchaseRequisitionHeader; "Purchase Requisition Header"."Prepared By")
            { }
            column(ConsignmentInvoiceNo_PurchaseRequisitionHeader; "Purchase Requisition Header"."Consignment Invoice No.")
            { }
            column(ReferenceOrder_PurchaseRequisitionHeader; "Purchase Requisition Header"."Reference Order")
            { }
            column(ReferencePNNo_PurchaseRequisitionHeader; "Purchase Requisition Header"."Reference PN No.")
            { }
            column(Department_PurchaseRequisitionHeader; "Purchase Requisition Header".Department)
            { }
            dataitem("Purchase Requistion Lines"; "Purchase Requistion Lines")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                column(LineNo_PurchaseRequistionLines; "Purchase Requistion Lines"."Line No.")
                { }
                column(No_PurchaseRequistionLines; "Purchase Requistion Lines"."No.")
                { }
                column(Description_PurchaseRequistionLines; "Purchase Requistion Lines".Description)
                { }
                column(Quantity_PurchaseRequistionLines; "Purchase Requistion Lines".Quantity)
                { }
                column(PurchUnitofMeasure_PurchaseRequistionLines; "Purchase Requistion Lines"."Purch. Unit of Measure")
                { }
                column(RequiredDeliveryDate_PurchaseRequistionLines; "Purchase Requistion Lines"."Required Delivery Date")
                { }
                column(Remarks_PurchaseRequistionLines; "Purchase Requistion Lines".Remarks)
                { }
                column(InventoryPostingGroup_Item; Item."Inventory Posting Group")
                { }
                column(GenProdPostingGroup_Item; Item."Gen. Prod. Posting Group")
                { }
                column(ItemCategoryCode_Item; Item."Item Category Code")
                { }
                column(Description_Item; Item.Description)
                { }
                column(Description2_Item; Item."Description 2")
                { }
                column(Inventory_Item; Item.Inventory)
                { }

                trigger OnAfterGetRecord();
                begin
                    Item.RESET;
                    IF Item.GET("No.") THEN;
                end;
            }
            trigger OnPreDataItem();
            begin
                CompanyInfo.GET;
                CompanyInfo.CALCFIELDS(Picture);
            end;
        }
    }
    var
        Item: Record Item;
        CompanyInfo: Record "Company Information";
}

