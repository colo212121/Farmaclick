namespace LoginFarmaclick.Models;
public class Receta
{
    
    public int IdDoctor { get; set; }
    public int IdReceta { get; set; }
    public int IdPaciente { get; set; }
    public string Contenido { get; set; }
    public string Fecha { get; set; }
    public string Producto { get; set; }
}
