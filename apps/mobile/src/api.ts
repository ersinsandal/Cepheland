const API_BASE = import.meta.env.VITE_API_BASE_URL || `http://${window.location.hostname}:3001`;

let userToken = '';

export function setUserToken(token: string) {
  userToken = token;
}

export function getUserToken() {
  return userToken;
}

export async function fetchApi<T>(endpoint: string, options: RequestInit = {}): Promise<T> {
  const headers = new Headers(options.headers || {});
  if (options.body) headers.set('Content-Type', 'application/json');
  if (userToken) {
    headers.set('Authorization', `Bearer ${userToken}`);
  }

  const res = await fetch(`${API_BASE}${endpoint}`, {
    ...options,
    signal: options.signal ? AbortSignal.any([options.signal, AbortSignal.timeout(10_000)]) : AbortSignal.timeout(10_000),
    headers,
  });

  if (!res.ok) {
    const errorData = await res.json().catch(() => ({}));
    throw new Error(errorData.error?.message || errorData.detail || errorData.title || `Error ${res.status}`);
  }

  return res.json();
}
