package models;

import java.util.Date;

//Desenvolvido por Beatriz Bastos Borges e Miguel Luizatto Alves

public class OrdemVenda 
{
    private int ordNo;
    private double purchAmt;
    private Date ordDate;
    private int customerId;
    private int salesmanId;

    public OrdemVenda() {}

    public OrdemVenda(int ordNo) 
    {
        this.ordNo = ordNo;
    }

    public OrdemVenda(double purchAmt, Date ordDate, int customerId, int salesmanId) 
    {
        this.purchAmt = purchAmt;
        this.ordDate = ordDate;
        this.customerId = customerId;
        this.salesmanId = salesmanId;
    }
    
    public OrdemVenda(int ordNo, double purchAmt, Date ordDate, int customerId, int salesmanId) 
    {
        this(ordNo);
        this.purchAmt = purchAmt;
        this.ordDate = ordDate;
        this.customerId = customerId;
        this.salesmanId = salesmanId;
    }

    public int getOrdNo() 
    {
        return this.ordNo;
    }

    public void setOrdNo(int ordNo) 
    {
        this.ordNo = ordNo;
    }

    public double getPurchAmt() 
    {
        return this.purchAmt;
    }

    public void setPurchAmt(double purchAmt) 
    {
        this.purchAmt = purchAmt;
    }

    public Date getOrdDate() 
    {
        return this.ordDate;
    }

    public void setOrdDate(Date ordDate) 
    {
        this.ordDate = ordDate;
    }

    public int getCustomerId() 
    {
        return this.customerId;
    }

    public void setCustomerId(int customerId) 
    {
        this.customerId = customerId;
    }

    public int getSalesmanId() 
    {
        return this.salesmanId;
    }

    public void setSalesmanId(int salesmanId) 
    {
        this.salesmanId = salesmanId;
    }
}