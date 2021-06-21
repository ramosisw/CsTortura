using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tortura.Nucleo.Persistencia;

namespace Tortura.Nucleo.Entidades {
    public class Boleto : Persistent {
        public override int Id { get; set; }
        public Usuario Cliente { get; set; }
        public string Folio { get; set; }
        public string NombreAsistente { get; set; }
        public DateTime FechaVenta { get; set; }
        public Seccion Seccion { get; set; }
    }
}
