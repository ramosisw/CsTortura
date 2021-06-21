using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tortura.Nucleo.Persistencia;
namespace Tortura.Nucleo.Entidades {
    public class Seccion : Persistent {
        public override int Id { get; set; }
        public string Nombre { get; set; }
        public double Precio { get; set; }
        public int Capacidad { get; set; }
        public Evento Evento { get; set; }
        public string Clave { get; set; }
    }
}
