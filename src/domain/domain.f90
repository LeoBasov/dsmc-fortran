module class_domain
   use class_cuboid
   implicit none
   private

   type, public :: domain
      type(cuboid) :: cube
   end type domain

end module class_domain
