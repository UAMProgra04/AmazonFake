using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Entidades_BD
{
    public class Cls_Entidad_Categoria_DAL
    {
        private string _codcategoria;
        private string _descategoria;

        public string Codcategoria
        {
            get
            {
                return _codcategoria;
            }

            set
            {
                _codcategoria = value;
            }
        }

        public string Descategoria
        {
            get
            {
                return _descategoria;
            }

            set
            {
                _descategoria = value;
            }
        }
    }
}
