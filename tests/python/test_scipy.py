import scipy
import scipy.special

def drumhead_height(n, k, distance, angle, t):
    nth_zero = scipy.special.jn_zeros(n, k)
    return scipy.cos(t)*scipy.cos(n*angle)*scipy.special.jn(n, distance*nth_zero)

theta = scipy.r_[0:2*scipy.pi:50j]
radius = scipy.r_[0:1:50j]
x = scipy.array([r*scipy.cos(theta) for r in radius])
y = scipy.array([r*scipy.sin(theta) for r in radius])
z = scipy.array([drumhead_height(1, 1, r, theta, 0.5) for r in radius])
print(z)
