module pusher_solver

contains
   subroutine push(positions, velocities, time_step)
      real, dimension(:, :), intent(out) :: positions
      real, dimension(:, :), intent(in) :: velocities
      real, intent(in) :: time_step

      positions = positions + velocities*time_step

   end subroutine push

end module pusher_solver
