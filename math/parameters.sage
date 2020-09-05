import sys

if __name__ == "__main__":
	if len(sys.argv) <= 1:
		print("Please provide the dimension of the polynomial and modulus")
		sys.exit(1)
	N = int(sys.argv[1])
	Q = int(sys.argv[2])

	if not is_prime(Q):
		print("Modulus is not prime. Exiting...")
		sys.exit(2)

	if (Q % (2 * N)) != 1:
		print("Modulus does not fulfill property Q = 1 mod 2 * N. Exiting...")
		sys.exit(3)

	# Q = 4294957057
	# N = 512
	# DBASE = 512
	print("N = ", N, "Q = ", Q)
	ZQ = Integers(Q)
	 

	one = ZQ.one()

	omega = one.nth_root(N)
	inv_omega = omega.inverse_of_unit()

	print("w = ", omega)
	print("w^-1 = ", inv_omega)

	phi = omega.square_root()
	inv_phi = phi.inverse_of_unit()
	inv_N = pow(N,Q-2,Q)

	print("phi = ", phi)
	print("phi^-1 = ", inv_phi)
	print("N^-1 = ", inv_N)
