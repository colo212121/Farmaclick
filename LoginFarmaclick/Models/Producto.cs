namespace LoginFarmaclick.Models;
public class Producto
{
    public string Nombre { get; set; }
    public string Precio { get; set; }
    public string Descripcion { get; set; }
    public int IdProducto { get; set; }
    public int Stock { get; set; }
    public int IdFarmacia { get; set; }
}
