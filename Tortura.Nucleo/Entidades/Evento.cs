using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tortura.Nucleo.Persistencia;
using Tortura.Nucleo.Enumeradores;

namespace Tortura.Nucleo.Entidades {
    public class Evento : Persistent {
        public override int Id { get; set; }
        public string Nombre { get; set; }
        public DateTime fechaHora { get; set; }
        public Lugar lugar { get; set; }
        public string Imagen { get; set; }
        public IList<Seccion> Secciones { get; set; }
        public int EdadMinima { get; set; }
        public Usuario CreadoPor { get; set; }
        public string Patrocinadores { get; set; }
        public TipoEvento Tipo { get; set; }
    }
}
