using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Entidades_BD
{
    public class Cls_Entidad_Detalle_Ventas_DAL
    {
        private string _codigo;
        private decimal _cantidad;
        private decimal _precio;
        private decimal _subtotal;
        private string _codproducto;
        private string _Respuesta;

        public string Codigo
        {
            get
            {
                return _codigo;
            }

            set
            {
                _codigo = value;
            }
        }

        public decimal Cantidad
        {
            get
            {
                return _cantidad;
            }

            set
            {
                _cantidad = value;
            }
        }

        public decimal Precio
        {
            get
            {
                return _precio;
            }

            set
            {
                _precio = value;
            }
        }

        public decimal Subtotal
        {
            get
            {
                return _subtotal;
            }

            set
            {
                _subtotal = value;
            }
        }

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
