using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Fisioterapia.Models.Entidades {
    public class Exercicios {

        public int Id { get; set; }
        public string Nome { get; set; }
        public int IdUsuario { get; set; }
        [ForeignKey("IdUsuario")]
        public virtual Usuarios Usuarios { get; set; }
        public ICollection<ExameExercicios> ExameExercicios { get; set; }
        


    }
}
