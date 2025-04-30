namespace LoginFarmaclick.Models;
public class NotificacionesDoctor
{
    public int IdNotificacion { get; set; }
    public int IdDoctor { get; set; }
    public int IdPaciente { get; set; }
    public string Contenido { get; set; }
}
