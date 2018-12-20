using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Entidades_BD
{
    public class Cls_Entidad_Productos_DAL
    {
        private string _codproducto;
        private string _desproducto;
        private string _codcategoria;
        private double _preproducto;
        private int _canproducto;
        private string _imagen;
        private string _Respuesta;

        public string Codproducto
        {
            get
            {
                return _codproducto;
            }

            set
            {
                _codproducto = value;
            }
        }

        public string Desproducto
        {
            get
            {
                return _desproducto;
            }

            set
            {
                _desproducto = value;
            }
        }

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

        public double Preproducto
        {
            get
            {
                return _preproducto;
            }

            set
            {
                _preproducto = value;
            }
        }

        public int Canproducto
        {
            get
            {
                return _canproducto;
            }

            set
            {
                _canproducto = value;
            }
        }

        public string Imagen
        {
            get
            {
                return _imagen;
            }

            set
            {
                _imagen = value;
            }
        }

        public string Respuesta
        {
            get
            {
                return _Respuesta;
            }

            set
            {
                _Respuesta = value;
            }
        }
    }
}
