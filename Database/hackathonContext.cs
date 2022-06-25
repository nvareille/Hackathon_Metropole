using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Database
{
    public partial class hackathonContext : DbContext
    {
        public hackathonContext()
        {
        }

        public hackathonContext(DbContextOptions<hackathonContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Entreprise> Entreprises { get; set; } = null!;
        public virtual DbSet<Fonction> Fonctions { get; set; } = null!;
        public virtual DbSet<Match> Matches { get; set; } = null!;
        public virtual DbSet<Projet> Projets { get; set; } = null!;
        public virtual DbSet<Reponse> Reponses { get; set; } = null!;
        public virtual DbSet<Soustheme> Sousthemes { get; set; } = null!;
        public virtual DbSet<Theme> Themes { get; set; } = null!;
        public virtual DbSet<Thread> Threads { get; set; } = null!;
        public virtual DbSet<Utilisateur> Utilisateurs { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#if DEBUG
                optionsBuilder.UseMySql("server=localhost;port=3306;user=root;database=hackathon", Microsoft.EntityFrameworkCore.ServerVersion.Parse("5.7.36-mysql"));
#else
                optionsBuilder.UseMySql("server=localhost;port=3307;user=root;database=hackathon", Microsoft.EntityFrameworkCore.ServerVersion.Parse("5.7.36-mysql"));
#endif
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.UseCollation("latin1_swedish_ci")
                .HasCharSet("latin1");

            modelBuilder.Entity<Entreprise>(entity =>
            {
                entity.ToTable("entreprise");

                entity.HasCharSet("utf8")
                    .UseCollation("utf8_general_ci");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("ID");

                entity.Property(e => e.Activité).HasMaxLength(255);

                entity.Property(e => e.Adresse).HasMaxLength(255);

                entity.Property(e => e.Bio).HasMaxLength(255);

                entity.Property(e => e.Cp)
                    .HasColumnType("text")
                    .HasColumnName("CP");

                entity.Property(e => e.Logo).HasColumnType("blob");

                entity.Property(e => e.Nom).HasColumnType("text");

                entity.Property(e => e.Siret)
                    .HasMaxLength(14)
                    .HasColumnName("SIRET");

                entity.Property(e => e.Taille).HasMaxLength(255);

                entity.Property(e => e.Type).HasColumnType("text");

                entity.Property(e => e.Ville).HasColumnType("text");
            });

            modelBuilder.Entity<Fonction>(entity =>
            {
                entity.ToTable("fonction");

                entity.HasCharSet("utf8")
                    .UseCollation("utf8_general_ci");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.Nom)
                    .HasColumnType("text")
                    .HasColumnName("nom");
            });

            modelBuilder.Entity<Match>(entity =>
            {
                entity.ToTable("match");

                entity.HasCharSet("utf8")
                    .UseCollation("utf8_general_ci");

                entity.HasIndex(e => e.Entreprise1, "Entreprise1");

                entity.HasIndex(e => e.Entreprise2, "Entreprise2");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.Entreprise1).HasColumnType("int(11)");

                entity.Property(e => e.Entreprise2).HasColumnType("int(11)");

                entity.Property(e => e.Pourquoient1)
                    .HasColumnType("text")
                    .HasColumnName("pourquoient1");

                entity.Property(e => e.Pourquoient2)
                    .HasColumnType("text")
                    .HasColumnName("pourquoient2");

                entity.Property(e => e.Utileent1).HasColumnName("utileent1");

                entity.Property(e => e.Utileent2).HasColumnName("utileent2");

                entity.HasOne(d => d.Entreprise1Navigation)
                    .WithMany(p => p.MatchEntreprise1Navigations)
                    .HasForeignKey(d => d.Entreprise1)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("match_ibfk_1");

                entity.HasOne(d => d.Entreprise2Navigation)
                    .WithMany(p => p.MatchEntreprise2Navigations)
                    .HasForeignKey(d => d.Entreprise2)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("match_ibfk_2");
            });

            modelBuilder.Entity<Projet>(entity =>
            {
                entity.ToTable("projet");

                entity.HasCharSet("utf8")
                    .UseCollation("utf8_general_ci");

                entity.HasIndex(e => e.Entreprise, "Entreprise");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("ID");

                entity.Property(e => e.Description).HasMaxLength(9999);

                entity.Property(e => e.Entreprise).HasColumnType("int(11)");

                entity.Property(e => e.Nom).HasMaxLength(255);

                entity.HasOne(d => d.EntrepriseNavigation)
                    .WithMany(p => p.Projets)
                    .HasForeignKey(d => d.Entreprise)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("projet_ibfk_1");
            });

            modelBuilder.Entity<Reponse>(entity =>
            {
                entity.ToTable("reponse");

                entity.HasCharSet("utf8")
                    .UseCollation("utf8_general_ci");

                entity.HasIndex(e => e.Thread, "thread");

                entity.HasIndex(e => e.Utilisateur, "utilisateur");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("ID");

                entity.Property(e => e.MisEnAvant).HasColumnName("mis en avant");

                entity.Property(e => e.Reponse1)
                    .HasColumnType("text")
                    .HasColumnName("reponse");

                entity.Property(e => e.Thread)
                    .HasColumnType("int(11)")
                    .HasColumnName("thread");

                entity.Property(e => e.Utilisateur)
                    .HasColumnType("int(255)")
                    .HasColumnName("utilisateur");

                entity.Property(e => e.Valide).HasColumnName("valide");

                entity.HasOne(d => d.ThreadNavigation)
                    .WithMany(p => p.Reponses)
                    .HasForeignKey(d => d.Thread)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("reponse_ibfk_1");

                entity.HasOne(d => d.UtilisateurNavigation)
                    .WithMany(p => p.Reponses)
                    .HasForeignKey(d => d.Utilisateur)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("reponse_ibfk_2");
            });

            modelBuilder.Entity<Soustheme>(entity =>
            {
                entity.ToTable("soustheme");

                entity.HasCharSet("utf8")
                    .UseCollation("utf8_general_ci");

                entity.HasIndex(e => e.Theme, "Theme");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.Nom).HasMaxLength(255);

                entity.Property(e => e.Theme).HasColumnType("int(11)");

                entity.HasOne(d => d.ThemeNavigation)
                    .WithMany(p => p.Sousthemes)
                    .HasForeignKey(d => d.Theme)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("soustheme_ibfk_1");
            });

            modelBuilder.Entity<Theme>(entity =>
            {
                entity.ToTable("theme");

                entity.HasCharSet("utf8")
                    .UseCollation("utf8_general_ci");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("ID");

                entity.Property(e => e.Nom).HasMaxLength(255);
            });

            modelBuilder.Entity<Thread>(entity =>
            {
                entity.ToTable("thread");

                entity.HasCharSet("utf8")
                    .UseCollation("utf8_general_ci");

                entity.HasIndex(e => e.Soustheme, "soustheme");

                entity.HasIndex(e => e.Utilisateur, "utilisateur");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("ID");

                entity.Property(e => e.Question)
                    .HasColumnType("text")
                    .HasColumnName("question");

                entity.Property(e => e.Soustheme)
                    .HasColumnType("int(11)")
                    .HasColumnName("soustheme");

                entity.Property(e => e.Utilisateur)
                    .HasColumnType("int(255)")
                    .HasColumnName("utilisateur");

                entity.HasOne(d => d.SousthemeNavigation)
                    .WithMany(p => p.Threads)
                    .HasForeignKey(d => d.Soustheme)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("thread_ibfk_2");

                entity.HasOne(d => d.UtilisateurNavigation)
                    .WithMany(p => p.Threads)
                    .HasForeignKey(d => d.Utilisateur)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("thread_ibfk_1");
            });

            modelBuilder.Entity<Utilisateur>(entity =>
            {
                entity.ToTable("utilisateurs");

                entity.HasCharSet("utf8")
                    .UseCollation("utf8_general_ci");

                entity.HasIndex(e => e.Entreprise, "Entreprise");

                entity.HasIndex(e => e.Fonction, "Fonction");

                entity.Property(e => e.Id)
                    .HasColumnType("int(255)")
                    .HasColumnName("ID");

                entity.Property(e => e.AdresseEmail)
                    .HasColumnType("text")
                    .HasColumnName("Adresse email");

                entity.Property(e => e.ContactEmail).HasColumnName("Contact email");

                entity.Property(e => e.ContactTel).HasColumnName("Contact tel");

                entity.Property(e => e.Entreprise).HasColumnType("int(11)");

                entity.Property(e => e.Fonction).HasColumnType("int(11)");

                entity.Property(e => e.Nom).HasColumnType("text");

                entity.Property(e => e.NumeroTel)
                    .HasColumnType("text")
                    .HasColumnName("Numero tel");

                entity.Property(e => e.Prenom).HasColumnType("text");

                entity.Property(e => e.Pseudo)
                    .HasMaxLength(255)
                    .HasColumnName("pseudo");

                entity.Property(e => e.Visites).HasColumnName("visites");

                entity.HasOne(d => d.EntrepriseNavigation)
                    .WithMany(p => p.Utilisateurs)
                    .HasForeignKey(d => d.Entreprise)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("utilisateurs_ibfk_1");

                entity.HasOne(d => d.FonctionNavigation)
                    .WithMany(p => p.Utilisateurs)
                    .HasForeignKey(d => d.Fonction)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("utilisateurs_ibfk_2");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
