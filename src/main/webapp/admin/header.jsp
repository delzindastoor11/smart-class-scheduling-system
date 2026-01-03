<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    :root {
      --bg:#111213;
      --panel:#1b1d1e;
      --muted:#9aa1a4;
      --accent:#19bdc4;
      --card-header:#1f2b44;
    }
    body { background: var(--bg); color: #e6e6e6; font-family: 'Segoe UI', sans-serif; }
    .admin-header { padding: 26px 18px; border-bottom: 1px solid rgba(255,255,255,0.03); }
    .dashboard-title { color: var(--accent); font-weight:700; }
    .metric-card { background: #1c1c1c; border-radius: 12px; padding: 30px; text-align:center; }
    .metric-card h5 { color: var(--muted); font-weight:600; }
    .metric-card .num { font-size:34px; color:var(--accent); margin-top:10px; }
    .nav-tabs .nav-link { color: #cfd8dc; }
    .nav-tabs .nav-link.active { color: var(--accent); border: none; border-bottom: 3px solid var(--accent); background: transparent; }
    .content { padding: 30px; }
    .dark-table thead { background: var(--card-header); color: #fff; }
    .table-card { background: transparent; border-radius: 10px; overflow: hidden; }
  </style>
</head>
<body>
  <header class="admin-header container-fluid">
    <div class="d-flex justify-content-between align-items-center">
      <div>
        <h1 class="dashboard-title">Admin Dashboard</h1>
        <div style="color:var(--muted)">Information Technology Department</div>
      </div>
      <div>
  <a href="<%= request.getContextPath() %>/LogoutServlet" 
     class="btn btn-dark" 
     style="background:#2b2b2b; color:#fff; border-radius:10px; padding:10px 16px; text-decoration:none;">
    Logout
  </a>
</div>

    </div>
  </header>

  <main class="content container-fluid">
