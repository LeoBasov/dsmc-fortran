module dsmc_solver
   use class_data
   implicit none
   private

   type, public :: dsmc
   contains
      procedure :: execute => execute_dsmc
   end type dsmc

contains
   subroutine execute_dsmc(this, particles)
      class(dsmc), intent(in) :: this
      type(Data), intent(inout) :: particles

   end subroutine execute_dsmc

end module dsmc_solver
