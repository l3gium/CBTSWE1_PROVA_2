package models;

//Desenvolvido por Beatriz Bastos Borges e Miguel Luizatto Alves

public class Vendedor 
{
	private int salesmanId; 
	private String name;
	private String city;
	private double commission;

    public Vendedor() {}
    
    public Vendedor(int salesmanId) 
    {
        this.salesmanId = salesmanId;
    }

    public Vendedor(String name, String city, double commission) 
    {
        this.name = name;
        this.city = city;
        this.commission = commission;
    }
    
    public Vendedor(int salesmanId, String name, String city, double commission) 
    {
    	this.salesmanId = salesmanId;
        this.name = name;
        this.city = city;
        this.commission = commission;
    }

    public int getSalesmanId() 
    {
        return this.salesmanId;
    }

    public String getName() 
    {
        return this.name;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getCity() 
    {
        return this.city;
    }

    public void setCity(String city) 
    {
        this.city = city;
    }

    public double getCommission() 
    {
        return this.commission;
    }

    public void setCommission(double commission) 
    {
        this.commission = commission;
    }
}
