namespace LoginFarmaclick.Models;
public class NotificacionesFarmacia
{
    public int IdNotificacion { get; set; }
    public int IdFarmacia { get; set; }
    public int IdPaciente { get; set; }
    public string Contenido { get; set; }
}
